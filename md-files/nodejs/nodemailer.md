```node
import nodemailer from 'nodemailer';
import fs from 'fs';

let arr = process.env.OUTPUT_EMAILS.split(',');

for (let i = 0; i < arr.length; i++) {
    const transporter = nodemailer.createTransport({
        host: 'smtp.freesmtpservers.com',
        port: 25,
        secure: false,
        secureConnection: false
    });

    fs.readFile("./report.pdf", function (err, data) {
        transporter.sendMail({
            from: arr[i],
            to: 'mateusz.adam.katana@gmail.com',
            subject: 'Test Email Subjectxxxx',
            text: 'Example Plain Text Message Body',
            attachments: [{'filename': 'report.pdf', 'content': data}]
        });
        console.log("Sent")
    });
}
```
