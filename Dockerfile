# Use the official Ruby image from Docker Hub
FROM ruby:3.2.2

# Set the working directory inside the container
WORKDIR /app

# Install dependencies
COPY Gemfile Gemfile.lock ./
RUN gem install bundler:2.2.32 && bundle install

# Copy the Rails application code into the container
COPY . .

# Precompile assets
RUN rails assets:precompile RAILS_ENV=development

# Expose port 3000 to the Docker host, so you can access the application
EXPOSE 3000

# Start the Rails server by default when the container starts
CMD ["rails", "server", "-b", "0.0.0.0"]
