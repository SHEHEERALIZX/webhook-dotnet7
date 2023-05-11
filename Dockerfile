# Base image
FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build

# Set working directory
WORKDIR /app

# Copy csproj and restore dependencies
COPY *.csproj ./
RUN dotnet restore

# Copy all other project files and build the project
COPY . ./
RUN dotnet publish -c Release -o out

# Runtime image
FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS runtime

# Set working directory
WORKDIR /app

# Copy published files from build image
COPY --from=build /app/out .

# Expose port 80 for the container
EXPOSE 80

# Start the ASP.NET Core application
ENTRYPOINT ["dotnet", "webhook_endpoint.dll"]
