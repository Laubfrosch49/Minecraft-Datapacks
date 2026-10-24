# Releasing

Pushing a tag on `main` builds the zip and publishes a GitHub release automatically.

## Steps

1. Commit and push your changes to `main`.
2. Create the tag and push it. The tag is `<datapack>-v<version>`:

   ```bash
   git tag sleepnotifier-v3.0.3
   git push origin sleepnotifier-v3.0.3
   ```

   ```bash
   git tag invisibleitemframe-v1.0.3
   git push origin invisibleitemframe-v1.0.3
   ```

3. Wait for the **Release** run under the Actions tab. The release then appears under Releases with `SleepNotifier.zip` or `InvisibleItemFrame.zip` attached.

## Fix a wrong tag

```bash
git tag -d sleepnotifier-v3.0.3
git push origin :refs/tags/sleepnotifier-v3.0.3
```

Delete the release on GitHub as well, then tag again.

## First time only

If the release step fails with a permission error, set *Settings > Actions > General > Workflow permissions* to **Read and write**.
