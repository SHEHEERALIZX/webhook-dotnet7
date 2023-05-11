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


# Expose port 80 for the container
EXPOSE 80

# Start the ASP.NET Core application
ENTRYPOINT ["dotnet", "out/webhook_endpoint.dll"]


