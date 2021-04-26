/* eslint-disable prettier/prettier */
const App = require("./src/config/app");

const { app } = new App();

const PORT = process.env.PORT || 4200;

app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
});
