const functions = require("firebase-functions");

const admin = require('firebase-admin');
admin.initializeApp();

exports.categoryCreated = functions.firestore
	.document("/categories/{categoryId}")
	.onCreate((_, context) => {
		const categoryId = context.params.categoryId;
		const categoryCounterDocRef = admin.firestore()
			.doc("/counters")
			.doc(categoryId);
		return categoryCounterDocRef
			.set({ total: 0, live: 0 });
	});