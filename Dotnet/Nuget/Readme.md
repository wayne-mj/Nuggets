## Readonly nuget.config file for Visual Studio

1. Add config file to root of solution directory
2. Under the repository's settings, specifically Secrets and variables add two new secrets PKG_TOKEN and USERNAME.  PKG_TOKEN will need to contain a Personal Access Token (Classic) created under the Developer Settings with packages read access.  USERNAME is your username.

This will need to be added to every project that accesses a Github hosted Nuget library, otherwise the Github Action will fail during the build process.