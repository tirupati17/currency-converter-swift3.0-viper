workflow "Send notification to slack " {
  resolves = ["GitHub Action for Slack"]
  on = "release"
}

action "GitHub Action for Slack" {
  uses = "Ilshidur/action-slack@4f4215e15353edafdc6d9933c71799e3eb4db61c"
  secrets = ["GITHUB_TOKEN"]
}
