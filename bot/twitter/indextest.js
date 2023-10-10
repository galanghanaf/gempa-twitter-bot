require("dotenv").config({ path: __dirname + "/.env" });
const express = require("express");
const bodyParser = require("body-parser");
const app = express();
const port = process.env.PORT || 8080;
const { twitterClient } = require("./twitterClient.js");
const CronJob = require("cron").CronJob;
const axios = require("axios");
const { download } = require("./utilities");

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.listen(port, () => {
	console.log(`Listening on port ${port}`);
});

const uri = "https://i.imgur.com/bsfRXhx.jpg";
const filename = "image.png";
async function earthquake(message) {
	download(uri, filename, async function () {
		try {
			const mediaId = await twitterClient.v1.uploadMedia("./image.png");
			await twitterClient.v2.tweet({
				text: message,
				media: {
					media_ids: [mediaId],
				},
			});
		} catch (e) {
			console.log(e);
		}
	});
}
earthquake("Try sending another image");
