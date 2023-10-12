# Gempa Twitter Bot

Sebuah bot twitter untuk mendeteksi adanya gempa bumi terbaru yang terjadi di Indonesia, berdasarkan data yang diambil secara berkala dari BMKG.

## Example

<p align="center">
    <img src="https://raw.githubusercontent.com/galanghanaf/gempa-twitter-bot/main/assets/img/twitter.png" alt="twitter-bot" height="450">
</p>

## Configuration

Tested in PHP 8.1.10 and NodeJS 18.18.0.

- Database Setup `application/config/database.php`
- Change URL `application/config/config.php`
- Install Module `cd bot/twitter` after that `npm install`
- Rename `bot/twitter/.env.example` to `bot/twitter/.env`
- Fill every singgle file in `bot/twitter/.env`
- Run `node index.js`
- That's it, done.
