FROM gcr.io/google-appengine/aspnetcore:3.1
EXPOSE 5009
ADD ./ /app
ENV ASPNETCORE_URLS=http://*:${PORT}
WORKDIR /app
ENTRYPOINT ["dotnet", "MailTemplating.dll"]