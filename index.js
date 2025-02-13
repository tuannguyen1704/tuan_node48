// let check = "welcome nodejs 48";
// console.log(check);
//import thư viện express
import express from "express";

// khởi tại ứng dụng express
const app = express();

// khai báo API đơn giản
// param 1 : đường dẫn API (string)
// param 2 : callback function (req, res)
// domain default của BE : http://localhost:3000
// req: nhận yêu cầu từ client (FE)
//res : trả về phản hồi cho client (FE)
app.get("/", (req, res) => {
  res.send("welcome to nodejs48");
});
app.get("/test", (req, res) => {
  res.send("test API");
});

//để BE luôn có code mới => cần cài nodemon(npm i nodemon)

//khai báo port mặc định cho BE
const port = 3000;

app.listen(port, () => {
  console.log(`server is running on port ${port}`);
});
