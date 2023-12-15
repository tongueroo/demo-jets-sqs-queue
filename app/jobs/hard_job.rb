class HardJob < ApplicationJob
  class_timeout 30 # must be less than or equal to the SQS queue default timeout
  depends_on :list # so we can reference list shared resources
  sqs_event ref(:waitlist) # reference sqs queue in shared resource
  def fix
    puts "fix #{JSON.dump(event)}"
  end
end
