import openai
import os
import sys

# Set your OpenAI API key (recommended: use an environment variable)
openai.api_key = os.getenv("OPENAI_API_KEY")

def chat_with_gpt(prompt):
    try:
        response = openai.ChatCompletion.create(
            model="gpt-4",
            messages=[{"role": "user", "content": prompt}],
            temperature=0.7,
        )
        return response.choices[0].message["content"].strip()
    except Exception as e:
        return f"Error: {str(e)}"

def main():
    if not openai.api_key:
        print("Error: OPENAI_API_KEY environment variable is not set.")
        sys.exit(1)

    print("ChatGPT CLI (type 'exit' to quit)")
    while True:
        try:
            user_input = input("You: ")
            if user_input.lower() in ["exit", "quit"]:
                break
            reply = chat_with_gpt(user_input)
            print("GPT:", reply)
        except KeyboardInterrupt:
            break

if __name__ == "__main__":
    main()

