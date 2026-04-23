$date = Get-Date -Format "yyyy-MM-dd"
$memoryDir = "D:\Claude\memory"
$dailyFile = "$memoryDir\warm\dailies\$date-daily.md"

# Run Claude in print mode with instructions to generate daily memory
claude -p `
  --system-prompt "今天是 $date。请根据之前的对话和上下文，生成一份每日记忆记录，写入到文件。格式如下：

# $date 每日记忆

## 今日完成
- 列出今天完成的主要任务

## 重要决策
- 记录今天做出的重要决定

## 洞察与反思
- 记录有价值的洞察或反思

## 明日待办
- 列出明天需要关注的事项

请基于你对用户工作的了解来填充内容。文件路径：$dailyFile

生成完内容后，使用 Write 工具将内容写入到 $dailyFile" `
  --add-dir $memoryDir `
  --output-format text

Write-Host "每日记忆已生成: $dailyFile"
