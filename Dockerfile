# Use the official Nginx image from Docker Hub
FROM nginx:alpine


COPY . /usr/share/nginx/html


# Expose port 80
EXPOSE 80

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]