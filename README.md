# LaLuce

Beauty salon website.

## Development
```bash
docker compose up app
```
Development server: http://localhost:5173

## Production
```bash
docker compose up app-prod
```
Production preview: http://localhost:4173

## Deploy to GitHub Pages

1. Push your code to GitHub
2. Go to repository Settings > Pages
3. Set source to "GitHub Actions"

The site will be deployed automatically on every push to main branch.

Note: If ports are in use, edit ports in docker-compose.yml 