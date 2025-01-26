# Use official Node.js image as base (try node:18 if encountering issues)
FROM node:18-alpine

# Set working directory (keep /zhao_wentao_site)
WORKDIR /zhao_wentao_site

# Copy package files and lock file
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install

# Copy all source code
COPY . .

# Build production version (build output in dist directory)
RUN npm run build

# Expose port 7775
EXPOSE 7775

# Choose one of these CMD instructions:
# -------------------------------------------------------------------------
# Start in development mode:
#  * For development environment, provides hot-reload
#  * Requires port mapping and volume mount in docker run command
#  * Example: docker run -p 7775:7775 -v $(pwd):/zhao_wentao_site your-image-name
#
CMD ["npm", "run", "dev", "--", "--host", "0.0.0.0", "--port", "7775"]