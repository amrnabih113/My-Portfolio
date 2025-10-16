# Deploying Flutter Portfolio to GitHub Pages

Follow these steps to deploy your portfolio to GitHub Pages:

## 1. Initialize Git Repository (if not already done)

```bash
git init
git add .
git commit -m "Initial commit: Flutter portfolio"
```

## 2. Create GitHub Repository

1. Go to [GitHub](https://github.com/new)
2. Create a new repository named `myportfolio`
3. Don't initialize with README (we already have one)

## 3. Link Local Repository to GitHub

```bash
git remote add origin https://github.com/amrnabih113/myportfolio.git
git branch -M main
git push -u origin main
```

## 4. Enable GitHub Pages

1. Go to your repository: https://github.com/amrnabih113/myportfolio
2. Click **Settings**
3. Scroll to **Pages** section (left sidebar)
4. Under **Source**, select:
   - Branch: `gh-pages`
   - Folder: `/ (root)`
5. Click **Save**

## 5. Push to GitHub to Trigger Deployment

The GitHub Actions workflow will automatically:

- Build your Flutter web app
- Deploy to GitHub Pages

```bash
git push origin main
```

## 6. Check Deployment Status

1. Go to **Actions** tab in your repository
2. Watch the "Deploy to GitHub Pages" workflow run
3. Once complete (green checkmark), your site will be live at:
   **https://amrnabih113.github.io/myportfolio/**

## 7. (Optional) Custom Domain

If you have a custom domain:

1. Go to **Settings** → **Pages**
2. Enter your custom domain
3. Add DNS records as instructed by GitHub

## Troubleshooting

### Workflow not running?

- Check if Actions are enabled: **Settings** → **Actions** → **General**
- Ensure workflow file is in `.github/workflows/deploy.yml`

### 404 errors?

- Verify `--base-href` in workflow matches your repo name
- Check if `gh-pages` branch was created successfully

### Asset loading issues?

- Ensure all asset paths are correct in `pubspec.yaml`
- Run `flutter pub get` before building

## Update Your Portfolio

Every time you push to main:

```bash
git add .
git commit -m "Update portfolio"
git push origin main
```

The site will automatically rebuild and deploy!
