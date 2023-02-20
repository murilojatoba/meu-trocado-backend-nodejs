module.exports = {
  client: "pg",
  connection: {
    host: "localhost",
    port: 5432,
    database: "postgres",
    user: "postgres",
    password: "123456"
  },
  pool: {
    min: 1,
    max: 3
  },
  migrations: {
    tableName: "migrations",
    directory: "./db/migrations",
    extension: "ts"
  },
  searchPath: ["public"],
  debug: true,
  useNullAsDefault: true
}