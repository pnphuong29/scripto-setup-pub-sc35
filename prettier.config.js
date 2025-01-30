// prettier.config.js, .prettierrc.js, prettier.config.mjs, or .prettierrc.mjs
// https://json.schemastore.org/prettierrc
/**
 * @see https://prettier.io/docs/en/configuration.html
 * @type {import("prettier").Config}
 */
const config = {
	useTabs: true,
	tabWidth: 4,
	singleQuote: true,
	semi: true,
	trailingComma: 'all',
	endOfLine: 'lf',
	bracketSpacing: true,
	printwidth: 200,
	overrides: [
		{
			files: ['*.html', '*.tsx', '*.jsx'],
			options: {
				tabWidth: 2,
			},
		},
		{
			files: ['*.md'],
			options: {
				parser: 'mdx',
			},
		},
		{
			files: ['*.yml', '*.yaml'],
			options: {
				singleQuote: false,
			},
		},
	],
};

module.exports = config;
// export default config;
