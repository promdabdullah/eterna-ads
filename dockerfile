# Use an official lightweight Nginx image
FROM nginx:alpine

# Remove default nginx website
RUN rm -rf /usr/share/nginx/html/*

# Copy your index.html into the container
COPY index.html /usr/share/nginx/html/index.html

# Expose port 5999
EXPOSE 5999

# Replace default Nginx config to use port 5999
RUN sed -i 's/listen       80;/listen       5999;/g' /etc/nginx/conf.d/default.conf

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]
