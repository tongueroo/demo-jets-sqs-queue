# Jets Project to Debug SQS Queue

Project to help debug [Shared SQS Queue #689](https://github.com/rubyonjets/jets/issues/689)

## How To

Create project with

    jets new demo
    
Add classes from [Generated Shared SQS Queue](https://docs.rubyonjets.com/docs/events/sqs/#generated-shared-sqs-queue) docs

    app/shared/resources/list.rb
    app/jobs/hard_job.rb
    app/jobs/postman_job.rb

To test more manually, find the sqs queue url.

    $ export QUEUE_URL=https://sqs.us-west-2.amazonaws.com/112233445566/demo-dev-List-NDBP8IFB1M05-Waitlist-StxATDNj3X78
    $ aws sqs send-message --queue-url $QUEUE_URL --message-body '{"test": "hello world"}'                                                                                   
    {
        "MD5OfMessageBody": "3d635e69eb93fd184b47a31d460ca2b6",
        "MessageId": "3a9a99e1-a866-4e68-ac31-e413fb495988"
    }
    $ 
    
You can log the hard_job-fix in another terminal and see the event coming in

    $ jets logs -f -n hard_job-fix
    Tailing logs for /aws/lambda/demo-dev-hard_job-fix
    Waiting for log group /aws/lambda/demo-dev-hard_job-fix to exist. Waiting 5 seconds.
    2023-12-15 18:17:55 UTC INIT_START Runtime Version: ruby:3.2.v9 Runtime Version ARN: arn:aws:lambda:us-west-2::runtime:b96ddb9b1905c3979339d7706a5f7cfda1d851593b1255eb0f15ff573c17fd28
    2023-12-15 18:17:58 UTC START RequestId: be392533-83a5-5aae-b263-78c5192df684 Version: $LATEST
    2023-12-15 18:17:58 UTC fix {"Records":[{"messageId":"3a9a99e1-a866-4e68-ac31-e413fb495988","receiptHandle":"AQEBzmNbOceOGqBkoYPEfF7ZUQ2MoXkrY1cHFADrUjDiw3t4ecP2ZOlhAOicrPONYzmC9EPkRRchxaGDH4mN/G5WfzyCmbUo/BQBFuvqpVhBrXpZJ8pNJPKkDfXSZbtpvMLdCofTHuAg6IhDU3K9l/EEQzlF9WSyOFnGfrsLY15yeGyJ4pfJ6R3+X6dt4uCy3fpU1hD2zwJoVrZVYz499Sr9b5vh+0zyR570idC2EQww+r6XkNR1YA2+rALsashA1XI/868ZPA2CGeaj+qAlPOoQUv0JBW22ulILUi0i8jzVu9sTcJAoyzz4JzAjq0uaSIa2WPShMKA7XN0ArM7bs3MJ6ngCnqHzOKR857i6dyN5BeVENH+2mQzHZwwUX0ImanOIWi1bxXEztzEr8SNo2l88r9gIk1Tw5QGmhGL1nw3lwg3nHwjH3hDZE9YED4YVqVJZ","body":"{\"test\": \"hello world\"}","attributes":{"ApproximateReceiveCount":"1","SentTimestamp":"1702664274758","SenderId":"AIDAJTCD6O457Q7BMTLYM","ApproximateFirstReceiveTimestamp":"1702664274764"},"messageAttributes":{},"md5OfBody":"3d635e69eb93fd184b47a31d460ca2b6","eventSource":"aws:sqs","eventSourceARN":"arn:aws:sqs:us-west-2:536766270177:demo-dev-List-NDBP8IFB1M05-Waitlist-StxATDNj3X78","awsRegion":"us-west-2"}]}
    2023-12-15 18:17:58 UTC END RequestId: be392533-83a5-5aae-b263-78c5192df684
    2023-12-15 18:17:58 UTC REPORT RequestId: be392533-83a5-5aae-b263-78c5192df684  Duration: 4.91 ms  Billed Duration: 5 ms    Memory Size: 1536 MB    Max Memory Used: 168 MB Init Duration: 3035.12 ms
