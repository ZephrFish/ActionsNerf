# ActionsNerf - History Wipe PoC

_A bit of chaos engineering_

A proof-of-concept repository that automatically wipes commit history and backdates to 01-01-1999 whenever a new commit is pushed.

## How It Works

1. Hourly random commits with ghost identities
2. Daily automatic history wipe at midnight UTC
3. Wipes all commit history on every push
4. Creates single backdated commits (year 1000-1999)
5. Uses random ghost identities with random domains

## Setup

### 1. Enable GitHub Actions
Ensure Actions are enabled in your repository settings.

### 2. Configure Branch Protection (Optional)
If you have branch protection, you may need to:
- Allow force pushes
- Or use a Personal Access Token with appropriate permissions

### 3. Making Ghost Commits

Use the provided script:
```bash
./ghost-commit.sh "Your commit message"
```

Or manually with random identity:
```bash
# The script automatically generates random identities
./ghost-commit.sh "Your message"
git push
```

## Files

- `.github/workflows/unified-chaos.yml` - All-in-one chaos workflow (hourly commits, history wipes, cleanup)
- `ghost-commit.sh` - Helper script for Ghost commits
- `README.md` - This file

## Testing

1. Make any change to a file
2. Run `./ghost-commit.sh "Test commit"`
3. Push to GitHub: `git push`
4. Watch the Actions tab - history will be wiped
5. Check commit history - only one commit from 1999

## Notes

- Hourly random commits automatically generated
- Daily history wipe at midnight UTC
- History wipe on every push to main/master
- All history permanently deleted on each run
- Repository dates randomly between 1970-1999
- Random ghost identities for every commit

## Troubleshooting

If the workflow fails:
- Check Actions permissions in repository settings
- Ensure the branch isn't protected against force pushes
- Verify the workflow has appropriate permissions
