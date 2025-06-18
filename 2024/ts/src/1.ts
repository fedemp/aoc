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

lcol.sort();
rcol.sort();

let result = 0;

for (let i = 0; i < lcol.length; i++) {
	const lvalue = lcol[i];
	const rvalue = rcol[i];

	assert(lvalue && rvalue);

	result = result + Math.abs(rvalue - lvalue);
}

console.log(result);
