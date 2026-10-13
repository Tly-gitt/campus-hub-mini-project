# Stage 1: Build React application
FROM node:22-alpine AS build

WORKDIR /app

# Copy dependency manifests
COPY package.json package-lock.json ./

# Install reproducible dependencies
RUN npm ci

# Copy source code
COPY . .

# Build static assets
RUN npm run build

# Stage 2: Serve static assets
FROM nginx:alpine

# Copy built frontend to Nginx web root
COPY --from=build /app/dist /usr/share/nginx/html

COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]