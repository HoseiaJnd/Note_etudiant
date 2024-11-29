const { Pool } = require('pg');

const pool = new Pool({
  user: 'postgres',
  host: 'localhost',
  database: 'note_semestre',
  password: 'hoseia2124',
  port: 5432,
});

module.exports = pool;