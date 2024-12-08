import express from 'express';
import routes from './routes';
import cors from 'cors';
import bodyParser from 'body-parser';

const app = express();
const port = 5000;

app.use(cors());
// app.use(express.json());
app.use(bodyParser.json({
  limit: '50mb',
}));
app.use('/',routes);

app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});
