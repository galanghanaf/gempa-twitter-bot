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

async function earthquake(messageEarthquake, imgEarthquake) {
	const uri = "https://data.bmkg.go.id/DataMKG/TEWS/" + imgEarthquake;

	const filename = "public/img/" + imgEarthquake.split(".jpg")[0] + ".png";

	download(uri, filename, async function () {
		const mediaId = await twitterClient.v1.uploadMedia(
			"./public/img/" + imgEarthquake.split(".jpg")[0] + ".png"
		);
		try {
			await twitterClient.v2.tweet({
				text: messageEarthquake,
				media: {
					media_ids: [mediaId],
				},
			});
		} catch (e) {
			console.log(e);
		}
	});
}

app.post("/", (req, res) => {
	const data = req.body;
	earthquake(data.earthquaketweet.toString(), data.earthquakeimg.toString());
	res.send(data.earthquaketweet.toString(), data.earthquakeimg.toString());
});

const cronTweet = new CronJob("10 * * * * *", async () => {
	// with Open Browser
	// require("child_process").exec(
	// 	"start http://localhost/gempa-twitter-bot/bmkg/earthquake"
	// );
	// with Open Browser

	axios
		.get("http://localhost/gempa-twitter-bot/bmkg/earthquake")
		.then(function (res) {
			console.log(res);
			// ... do something with the response
		})
		.catch(function (error) {
			console.log(error);
		});
});

cronTweet.start();
