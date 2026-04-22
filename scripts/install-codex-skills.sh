#!/bin/sh
set -eu

REPO_TARBALL_URL="https://github.com/zijian-ai-projects/SageTalk/archive/refs/heads/main.tar.gz"
DEST="${CODEX_HOME:-$HOME/.codex}/skills"
FORCE=0
DRY_RUN=0
SOURCE_ROOT=""
TMP_CREATED=""

SKILLS="sage-talk sage-confucius sage-mencius sage-laozi sage-zhuangzi sage-mozi sage-hanfeizi sage-sunzi sage-wang-yangming"

usage() {
  cat <<'USAGE'
Install SageTalk Codex skills as a pack.

Usage:
  scripts/install-codex-skills.sh [options]
  curl -fsSL https://raw.githubusercontent.com/zijian-ai-projects/SageTalk/main/scripts/install-codex-skills.sh | sh

Options:
  --dest DIR     Install into DIR instead of ${CODEX_HOME:-$HOME/.codex}/skills
  --source DIR   Use a local SageTalk repository checkout as the source
  --force        Replace existing SageTalk skill directories in the destination
  --dry-run      Print what would be installed without copying files
  -h, --help     Show this help
USAGE
}

die() {
  echo "ERROR: $1" >&2
  exit 1
}

cleanup() {
  if [ -n "$TMP_CREATED" ] && [ -d "$TMP_CREATED" ]; then
    rm -rf "$TMP_CREATED"
  fi
}

trap cleanup EXIT INT TERM

while [ "$#" -gt 0 ]; do
  case "$1" in
    --dest)
      [ "$#" -ge 2 ] || die "--dest requires a directory"
      DEST=$2
      shift 2
      ;;
    --source)
      [ "$#" -ge 2 ] || die "--source requires a directory"
      SOURCE_ROOT=$2
      shift 2
      ;;
    --force)
      FORCE=1
      shift
      ;;
    --dry-run)
      DRY_RUN=1
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      die "unknown option: $1"
      ;;
  esac
done

find_local_source() {
  if [ -d ".agents/skills" ]; then
    pwd
    return 0
  fi

  case "$0" in
    */*)
      script_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
      repo_root=$(CDPATH= cd -- "$script_dir/.." && pwd)
      if [ -d "$repo_root/.agents/skills" ]; then
        printf '%s\n' "$repo_root"
        return 0
      fi
      ;;
  esac

  return 1
}

download_source() {
  command -v curl >/dev/null 2>&1 || die "curl is required for remote install"
  command -v tar >/dev/null 2>&1 || die "tar is required for remote install"
  command -v mktemp >/dev/null 2>&1 || die "mktemp is required for remote install"

  TMP_CREATED=$(mktemp -d "${TMPDIR:-/tmp}/sagetalk-install.XXXXXX")
  archive="$TMP_CREATED/sagetalk.tar.gz"

  echo "Downloading SageTalk from GitHub..."
  curl -fsSL "$REPO_TARBALL_URL" -o "$archive"
  tar -xzf "$archive" -C "$TMP_CREATED"

  found=$(find "$TMP_CREATED" -maxdepth 1 -type d -name 'SageTalk-*' | sed -n '1p')
  [ -n "$found" ] || die "downloaded archive did not contain SageTalk source"
  printf '%s\n' "$found"
}

if [ -z "$SOURCE_ROOT" ]; then
  if SOURCE_ROOT=$(find_local_source); then
    :
  else
    SOURCE_ROOT=$(download_source)
  fi
fi

SKILLS_SOURCE="$SOURCE_ROOT/.agents/skills"
[ -d "$SKILLS_SOURCE" ] || die "missing skills source: $SKILLS_SOURCE"
[ -n "$DEST" ] || die "destination cannot be empty"

echo "Source: $SKILLS_SOURCE"
echo "Destination: $DEST"

for skill in $SKILLS; do
  [ -d "$SKILLS_SOURCE/$skill" ] || die "missing source skill: $skill"
done

if [ "$DRY_RUN" -eq 1 ]; then
  for skill in $SKILLS; do
    echo "Would install: $skill"
  done
  echo "Dry run complete."
  exit 0
fi

mkdir -p "$DEST"

for skill in $SKILLS; do
  source_dir="$SKILLS_SOURCE/$skill"
  target_dir="$DEST/$skill"

  if [ -e "$target_dir" ] && [ "$FORCE" -ne 1 ]; then
    die "$target_dir already exists. Re-run with --force to replace SageTalk skills."
  fi

  if [ -e "$target_dir" ]; then
    rm -rf "$target_dir"
  fi

  cp -R "$source_dir" "$DEST/"
  echo "Installed: $skill"
done

echo "SageTalk skills installed. Restart Codex to pick up new skills."
