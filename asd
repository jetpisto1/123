import discord
import random

client = discord.Client()

@client.event
async def on_ready():
    print(f'Logged in as {client.user.name} ({client.user.id})')

@client.event
async def on_message(message):
    if message.author == client.user:
        return

    if message.content.startswith('-팀'):
        # 입력한 단어 목록 확인
        content = message.content.split(' ', 1)
        if len(content) != 2:
            await message.channel.send('올바른 명령어 형식이 아닙니다. !팀 [베티 캔 DRX] 형태로 입력해주세요.')
            return

        word_list = content[1].split()

        # 입력한 단어 개수 확인
        if len(word_list) < 3:
            await message.channel.send('인원이 충분하지 않습니다. 3명 이상의 인원 입력해주세요.')
            return

        # 단어를 랜덤하게 선택하여 3개로 나눔
        random.shuffle(word_list)
        team_count = len(word_list) // 3
        remaining_words = len(word_list) % 3

        divided_words = [word_list[i*3:(i+1)*3] for i in range(team_count)]

        # 남은 단어를 2개로 나눔
        if remaining_words == 2:
            divided_words.append(word_list[-2:])
        elif remaining_words == 1:
            divided_words.append(word_list[-1:])

        # 결과 출력
        for i, words in enumerate(divided_words):
            words_str = ', '.join(words)
            await message.channel.send(f'```팀 {i+1}: {words_str}```')


    if message.content.startswith('-마'):
        n = int(message.content.split()[1])

        words = [
            '스네이크맨', '검은수염', '나미', '로우', '루치', '브룩', '시라호시', '프랑키', '아카이누', '키자루', 
            '아오키지', '샹크스', '상디', '타시기', '키드', '드래곤', '빅맘', '센고쿠', '제트', '시키', '미호크', '에이스', '핸콕', '오뎅', '레드필드', '시노부', '에넬'
        ]

        selected_words = random.sample(words, n)

        response = '**마뎀 밴살 결과\n**'
        response += '```\n'
        response += '\n'.join(selected_words)
        response += '```\n'
        await message.channel.send(response)

    if message.content.startswith('-물'):
        n = int(message.content.split()[1])

        words = [
            '도플라밍고', '로빈', '루피', '바질호킨스', '사보', '우솝', '조로', '징베', '쵸파', '후지토라', 
            '료쿠규', '야마토', '카타쿠리', '킹', '크로커다일', '레베카', '흰수염', '로져', '거프', '레일리', '카이도', '버기', '카벤딧슈'
        ]

        selected_words = random.sample(words, n)

        response = '**물뎀 밴살 결과\n**'
        response += '```\n'
        response += '\n'.join(selected_words)
        response += '```\n'
        await message.channel.send(response)

    if message.content == '-다이스':
        random_number = random.randint(1, 100)
        await message.channel.send(f"결과: {random_number}")



    if '-도움말' in message.content:
        await message.channel.send('**ex) -물 2 , -마 6 , -다이스 , -팀 [닉네임 띄어쓰기로 입력]**' )

# 디스코드 봇 토큰을 입력합니다.
client.run('MTExMzMwNTk1NzA4MzEzMTkyNA.Gmf2u4.jxUXIqfTnQ79Pg2Pc2HjqQionLsBT_Aj5XfPN4')