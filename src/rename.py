import os

# percorre todos os diretorios e os filhos
for root, dirs, files in os.walk("."):

    for file in dirs:
        if not file[0].islower():
            continue

        if root == '.\.import':
            continue

        if 'Tiles' in root:
            continue

        if 'locales' in root:
            continue

        if file.endswith('.py'):
            continue

        if file.endswith('.md5'):
            continue

        if file.endswith('.stex'):
            continue

        if file.endswith('.import'):
            continue

        # imprime o caminho completo do arquivo
        print(root)
        new_name = input(file + ' ')
        if new_name == '':
            continue

        os.system(f'git mv {os.path.join(root, file)} tmp')
        os.system(f'git mv tmp {os.path.join(root, new_name)}')

    '''
    print('file')
    for file in files:
        if not file[0].islower():
            continue
        # imprime o caminho completo do arquivo
        print(os.path.join(root, file))

    input()

    '''
