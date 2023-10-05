require("dotenv").config({ path: __dirname + "/.env" });
const express = require("express");
const bodyParser = require("body-parser");
const app = express();
const port = process.env.PORT || 8080;
const { twitterClient } = require("./twitterClient.js");
const CronJob = require("cron").CronJob;
const axios = require("axios");

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.listen(port, () => {
	console.log(`Listening on port ${port}`);
});

async function earthquake(message) {
	try {
		await twitterClient.v2.tweet(message);
	} catch (e) {
		console.log(e);
	}
}
app.post("/", (req, res) => {
	const data = req.body;
	earthquake(data.earthquaketweet.toString());
	res.send(data.earthquaketweet.toString());
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
