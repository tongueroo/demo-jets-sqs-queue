class PostmanJob < ApplicationJob
  include Jets::AwsServices

  iam_policy "sqs"
  def deliver
    puts "queue arn: #{List.lookup(:waitlist)}"
    puts "queue url: #{List.lookup(:waitlist_url)}"
    queue_url = List.lookup(:waitlist_url)
    message_body = JSON.dump({"test": "hello world"})
    sqs.send_message(
      queue_url: queue_url,
      message_body: message_body,
    )
  end
end
