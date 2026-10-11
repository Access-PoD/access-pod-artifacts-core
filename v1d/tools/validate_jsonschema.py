#!/usr/bin/env python3
"""
validate_jsonschema.py

Validate a JSON document against a JSON Schema (Draft 2020-12).

Paths are resolved relative to the repository root (parent of /tools),
unless absolute paths are provided.

Usage:
    python validate_jsonschema.py <schema.json> <data.json>

Exit codes:
    0  - validation passed
    1  - validation failed
    2  - usage or file error
"""

import sys
import json
from pathlib import Path
from jsonschema import Draft202012Validator


def repo_root() -> Path:
    """
    Assume this script lives in <repo>/tools/.
    Repo root is therefore parent of this file's directory.
    """
    return Path(__file__).resolve().parent.parent


def resolve_path(p: str) -> Path:
    path = Path(p)
    if path.is_absolute():
        return path
    return repo_root() / path


def load_json(path: Path):
    try:
        with path.open("r", encoding="utf-8") as f:
            return json.load(f)
    except json.JSONDecodeError as e:
        print(f"[ERROR] Invalid JSON in {path}: {e}", file=sys.stderr)
        sys.exit(2)
    except OSError as e:
        print(f"[ERROR] Cannot read {path}: {e}", file=sys.stderr)
        sys.exit(2)


def main():
    if len(sys.argv) != 3:
        print(
            "Usage: python validate_jsonschema.py <schema.json> <data.json>",
            file=sys.stderr,
        )
        sys.exit(2)

    schema_path = resolve_path(sys.argv[1])
    data_path = resolve_path(sys.argv[2])

    if not schema_path.exists():
        print(f"[ERROR] Schema file not found: {schema_path}", file=sys.stderr)
        sys.exit(2)

    if not data_path.exists():
        print(f"[ERROR] Data file not found: {data_path}", file=sys.stderr)
        sys.exit(2)

    schema = load_json(schema_path)
    data = load_json(data_path)

    validator = Draft202012Validator(schema)
    errors = sorted(validator.iter_errors(data), key=lambda e: list(e.path))

    if errors:
        print("VALIDATION: FAIL\n", file=sys.stderr)
        for err in errors:
            path = ".".join(str(p) for p in err.path) or "<root>"
            print(f"- Path: {path}", file=sys.stderr)
            print(f"  Error: {err.message}", file=sys.stderr)
            if err.schema_path:
                spath = ".".join(str(p) for p in err.schema_path)
                print(f"  Schema: {spath}", file=sys.stderr)
            print("", file=sys.stderr)
        sys.exit(1)

    print("VALIDATION: PASS")
    print(f"Schema : {schema_path}")
    print(f"Data   : {data_path}")
    sys.exit(0)


if __name__ == "__main__":
    main()
