import express from "express";
import http from "http";

const app = express();

function fib(num: number): number {
    if (num < 2) return num;
    return fib(num - 1) + fib(num - 2);
}


app.get('/fib/:num', function (req, res) {
    const num = Number(req.params.num);
    const answer = fib(num);
    return res.send(`Fibonacci number of term ${num} is ${answer}`);
});


const server = http.createServer(app);
server.listen(3000, () => console.log(`Application is running on port 3000`));