import re

MATCH = "FILE_JSON/.*?Account.json"

full_list = [
  "test-eob/PROCESSED_BY/FILE_JSON/222-Account.json",
  "test-eob/PROCESSED_BY/FILE_JSON/1212121-Account.json",
  "test-eob/PROCESSED_BY/FILE_JSON/122-multi.json",
  "test-eob/PROCESSED_BY/FILE_JSON/qwqwq-Account.json",
  "test-eob/PROCESSED_BY/FILE_JSON/wqwqw-multi.json"
]

for item in full_list:
  if re.search(MATCH, item):
    print(item)