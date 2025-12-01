const PostgresDriver = require('@cubejs-backend/postgres-driver');

module.exports = {
  // Provides distinct identifiers for each tenant which are used as caching keys
  contextToAppId: ({ securityContext }) =>
    `CUBEJS_APP_${securityContext.tenant}`,

  // Selects the database connection configuration based on the tenant name
  driverFactory: ({ securityContext }) => {
    return new PostgresDriver({
      database: 'localDB',
      host: 'postgres',
      user: 'postgres',
      password: 'example',
      port: '5432',
    });
  },
};
