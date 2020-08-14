#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/core/aspnet:3.1-buster-slim AS base
WORKDIR /app
EXPOSE 80
ENV ASPNETCORE_ENVIRONMENT=Development
ENV ASPNETCORE_URLS http://*:80

FROM mcr.microsoft.com/dotnet/core/sdk:3.1-buster AS build
WORKDIR /src
COPY ["MailTemplating.csproj", ""]
RUN dotnet restore "./MailTemplating.csproj"
COPY . .
WORKDIR "/src/."
RUN dotnet build "MailTemplating.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "MailTemplating.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "MailTemplating.dll"]