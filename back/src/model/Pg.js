const { Pool } = require("pg");

/**
 *
 *
 * @class Pg
 */
class Pg {
  /**
   * Creates an instance of Pg.
   * @param {string} host
   * @param {number} port
   * @param {string} user
   * @param {string} password
   * @param {string} database
   * @memberof Pg
   */
  constructor(host, port, user, password, database) {
    this.HOST = host;
    this.PORT = port;
    this.USER = user;
    this.PASSWD = password;
    this.DB = database;
  }

  /**
   *
   *
   * @return {object}
   * @memberof Pg
   */
  async getMembers() {
    const pool = new Pool({
      host: this.HOST,
      port: this.PORT,
      user: this.USER,
      password: this.PASSWD,
      database: this.DB,
    });

    return pool
      .query("SELECT * FROM members;")
      .then((res) => {
        pool.end();

        return res;
      })
      .catch((err) => {
        pool.end();

        return err;
      });
  }

  /**
   *
   *
   * @param {string} sqlScript
   * @return {object}
   * @memberof Pg
   */
  async query(sqlScript) {
    const pool = new Pool({
      host: this.HOST,
      port: this.PORT,
      user: this.USER,
      password: this.PASSWD,
      database: this.DB,
    });

    return pool
      .query(sqlScript)
      .then((res) => {
        pool.end();

        return res;
      })
      .catch((err) => {
        pool.end();

        return err;
      });
  }
}

module.exports = Pg;
