import assert from "assert";
import fs from "fs";

const input = fs.readFileSync("input.txt", { encoding: "utf8" });
const [lcol, rcol] = input
	.trim()
	.split("\n")
	.reduce(
		(acc: [left: number[], right: number[]], item) => {
			const [left, right] = item.split("   ").map(Number);
			assert(
				left != null &&
					!Number.isNaN(left) &&
					right != null &&
					!Number.isNaN(right),
			);
			acc[0].push(left);
			acc[1].push(right);
			return acc;
		},
		[[], []],
	);

rcol.sort();

let result = 0;

for (const left of lcol) {
	let matches = 0;
	for (const right of rcol) {
		if (right > left) {
			break;
		}
		if (left === right) {
			matches = matches + 1;
		}
	}
	result = result + left * matches;
}

console.log(result);
