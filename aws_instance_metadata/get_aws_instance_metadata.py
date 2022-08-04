import boto3

client = boto3.client('ec2')
resp =client.describe_instances()

# Serializing json
json_object = json.dumps(dictionary, indent = 4)
print(json_object)

keyVal = input("Enter a key value: \n")

if keyVal in json_object:
    # Print the success message and the value of the key
    print("%s is found in JSON data" %keyVal)
    print("The value of", keyVal,"is", customer[keyVal])
else:
    # Print the message if the value does not exist
    print("%s is not found in JSON data" %keyVal)