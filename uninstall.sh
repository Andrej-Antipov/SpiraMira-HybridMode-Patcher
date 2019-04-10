#!/bin/sh

clear

osascript -e "tell application \"Terminal\" to set the font size of window 1 to 12"
osascript -e "tell application \"Terminal\" to set background color of window 1 to {1028, 12850, 65535}"
osascript -e "tell application \"Terminal\" to set normal text color of window 1 to {65535, 65535, 65535}"

clear 

loc=`locale | grep LANG | sed -e 's/.*LANG="\(.*\)_.*/\1/'`


            if [ ! $loc = "ru" ]; then
printf '\n\n*****              SpiraMira Hybrid Mode Patch Remover               ******\n'
printf '*****                          Version 1.1                           ******\n'
                else
printf '\n\n*****         Удаляем патч гибридного режима интерфейса SpiraMira         ******\n'
printf '*****                            Версия 1.1                               ******\n'
            fi


sleep 0.5

 if [ ! $loc = "ru" ]; then
printf '*****              Your system '
printf "`sw_vers -productName`"
printf ': '; printf "`sw_vers -productVersion`" 
printf '('
printf "`sw_vers -buildVersion`"
printf ') '
printf '            ******\n\n\n'
                else
printf '*****                Ваша система '
printf "`sw_vers -productName`"
printf ': '; printf "`sw_vers -productVersion`" 
printf '('
printf "`sw_vers -buildVersion`"
printf ') '
printf '              ******\n\n\n'
            fi

string=`sw_vers -productVersion` 
string=`echo ${string//[^0-9]/}`
string=${string:0:5}


if [ "$string" != "10141" ] && [ "$string" != "10142" ] && [  "$string" != "10143" ] && [  "$string" != "10144" ]; then
            if [ ! $loc = "ru" ]; then
    printf '\nThis program is for 10.14.1 - 10.14.4 (Mojave) only\n'
    printf '\n!!!! UNABLE TO CONTUNUE. BYE !!!!\n\n\n\n\n'
    read -p "Press any key to close this window " -n 1 -r
            else
    printf '\nЭта программа только для 10.14.1 - 10.14.4 (Mojave) \n'
    printf '\n!!!! ВЫПОЛНЕНИЕ НЕВОЗМОЖНО. ВЫХОД !!!!\n\n\n\n\n'
    read -p "Для выхода нажмите любую клавишу" -n 1 -r
        fi
    osascript -e 'tell application "Terminal" to close first window' & exit

    exit
fi

cd $(dirname $0)

unzip  -o -qq HybridMode.zip 
unzip  -o -qq Original.zip

if [ -f "Original/$string/CoreUI" ]; then
SystemCoreUI=`md5 -q /System/Library/PrivateFrameworks/CoreUI.framework/Versions/Current/CoreUI`
BackCoreUI=`md5 -q Original/$string/CoreUI`
fi
if [ -f "Original/$string/HIToolbox" ]; then
SystemHIToolbox=`md5 -q /System/Library/Frameworks/Carbon.framework/Frameworks/HIToolbox.framework/Versions/Current/HIToolbox`
BackHIToolbox=`md5 -q Original/$string/HiToolbox`
fi

frstat=0
error=0

if [ ! -f "Original/$string/CoreUI" ]; then
                if [ -f "/System/Library/PrivateFrameworks/CoreUI.framework/Versions/Current/CoreUI.back" ]; then

                                if [ ! $loc = "ru" ]; then
                                printf 'To continue enter your mac user account password\n'
                                printf 'To escape press CTRL+Z keys\n\n'
                                                    else
                                printf 'Для продолжения введите пароль пользователя мак\n'
                                printf 'Для отмены выполнения нажмите CTRL+Z \n\n'
                                fi
            me=`sudo whoami`
            frstat=1
            sudo rm /System/Library/PrivateFrameworks/CoreUI.framework/Versions/Current/CoreUI
            sudo cp /System/Library/PrivateFrameworks/CoreUI.framework/Versions/Current/CoreUI.back /System/Library/PrivateFrameworks/CoreUI.framework/Versions/Current/CoreUI
            sudo chmod 755 /Volumes/OSX/S*/L*/PrivateFrameworks/CoreUI.framework/Versions/Current/CoreUI
            sudo chown 0:0 /Volumes/OSX/S*/L*/PrivateFrameworks/CoreUI.framework/Versions/Current/CoreUI
            sudo rm /System/Library/PrivateFrameworks/CoreUI.framework/Versions/Current/CoreUI.back
                if [ $loc = "ru" ]; then
            printf '\nВосстановлен CoreUI из бэкапа\n'
                    else
            printf '\nOriginal CoreUI restored from backup\n'
                 fi
                    else
                        error=1
                                if [ $loc = "ru" ]; then
                        printf '\nНет бэкапа для восстановления оригинального CoreUI\n'
                                    else
                        printf '\nThe Backup to restore original CoreUI is not found\n'
                                fi
                fi
     else
                if [[ $SystemCoreUI = $BackCoreUI ]]; then
                    error=2
                        if [ ! $loc = "ru" ]; then
                    printf '\nThe CoreUI already original\n'
                            else
                    printf '\nCoreUI уже оригинальный\n'
                        fi

                    else

                                if [ ! $loc = "ru" ]; then
                                printf 'To continue enter your mac user account password\n'
                                printf 'To escape press CTRL+Z keys\n\n'
                                                    else
                                printf 'Для продолжения введите пароль пользователя мак\n'
                                printf 'Для отмены выполнения нажмите CTRL+Z \n\n'
                                fi

        me=`sudo whoami`
        frstat=1
        sudo rm /System/Library/PrivateFrameworks/CoreUI.framework/Versions/Current/CoreUI
        sudo cp Original/$string/CoreUI /System/Library/PrivateFrameworks/CoreUI.framework/Versions/Current/
        sudo chmod 755 /Volumes/OSX/S*/L*/PrivateFrameworks/CoreUI.framework/Versions/Current/CoreUI
        sudo chown 0:0 /Volumes/OSX/S*/L*/PrivateFrameworks/CoreUI.framework/Versions/Current/CoreUI
                        if [ $loc = "ru" ]; then    
        printf '\nВосстановлен CoreUI из папки Original ('$string') \n'
                            else
        printf '\nOriginal CoreUI restored from this script folfer ('$string') \n'
                        fi
                fi
fi


if [ ! -f "Original/$string/HIToolbox" ]; then
                if [ -f "/System/Library/Frameworks/Carbon.framework/Frameworks/HIToolbox.framework/Versions/Current/HIToolbox.back" ]; then
                                
                                 
                                 
                         if [ ! "$me" = "root" ]; then
                                if [ ! $loc = "ru" ]; then
                                printf 'To continue enter your mac user account password\n'
                                printf 'To escape press CTRL+Z keys\n\n'
                                                    else
                                printf 'Для продолжения введите пароль пользователя мак\n'
                                printf 'Для отмены выполнения нажмите CTRL+Z \n\n'
                                fi
                          fi
            frstat=1
            sudo rm /System/Library/Frameworks/Carbon.framework/Frameworks/HIToolbox.framework/Versions/Current/HIToolbox
            sudo cp /System/Library/Frameworks/Carbon.framework/Frameworks/HIToolbox.framework/Versions/Current/HIToolbox.back /System/Library/Frameworks/Carbon.framework/Frameworks/HIToolbox.framework/Versions/Current/HIToolbox
            sudo chmod 755 /Volumes/OSX/S*/L*/Frameworks/Carbon.framework/Frameworks/HIToolbox.framework/Versions/Current/HIToolbox
            sudo chown 0:0 /Volumes/OSX/S*/L*/Frameworks/Carbon.framework/Frameworks/HIToolbox.framework/Versions/Current/HIToolbox
            sudo rm /System/Library/Frameworks/Carbon.framework/Frameworks/HIToolbox.framework/Versions/Current/HIToolbox.back
                    if [ $loc = "ru" ]; then
            printf '\nВосстановлен HIToolbox из бэкапа\n'
                        else
            printf '\nOriginal HIToolbox restored from backup\n'
                    fi
                  else
                        error=1
                                    if [ $loc = "ru" ]; then
                        printf '\nНет бэкапа для восстановления оригинального HIToolbox\n'
                                            else
                        printf '\nThe Backup to restore original HIToolbox is not found\n'
                                    fi
                fi
     else
                 if [[ $SystemHIToolbox = $BackHIToolbox ]]; then
                        error=3
                        if [ ! $loc = "ru" ]; then
                    printf '\nThe HIToolbox already original\n'
                            else
                    printf '\nHIToolbox оригинальный\n'
                        fi
                    else
                                    
                                    
                            if [ ! "$me" = "root" ]; then
                                if [ ! $loc = "ru" ]; then
                                printf 'To continue enter your mac user account password\n'
                                printf 'To escape press CTRL+Z keys\n\n'
                                                    else
                                printf 'Для продолжения введите пароль пользователя мак\n'
                                printf 'Для отмены выполнения нажмите CTRL+Z \n\n'
                                fi
                            fi
        frstat=1
        sudo rm /System/Library/Frameworks/Carbon.framework/Frameworks/HIToolbox.framework/Versions/Current/HIToolbox
        sudo cp Original/$string/HiToolbox /System/Library/Frameworks/Carbon.framework/Frameworks/HIToolbox.framework/Versions/Current/
        sudo chmod 755 /Volumes/OSX/S*/L*/Frameworks/Carbon.framework/Frameworks/HIToolbox.framework/Versions/Current/HIToolbox
        sudo chown 0:0 /Volumes/OSX/S*/L*/Frameworks/Carbon.framework/Frameworks/HIToolbox.framework/Versions/Current/HIToolbox
                    if [ $loc = "ru" ]; then   
        printf '\nВосстановлен HIToolbox из папки Original ('$string') \n'
                            else
        printf '\nOriginal HIToolbox restored from this script folfer ('$string') \n'
                    fi
                fi
fi

printf ' \n'


if [[ $frstat == 1 ]]
	then

            if [ ! $loc = "ru" ]; then
printf '\nupdate the system frameworks cache. It takes a few minutes\n'
printf '\nProcessing: '
                else
printf '\nОбновляем кэш системных сценариев. Это занимает несколько минут\n'
printf '\nВыполняется: '
            fi
sleep 1


while :;do printf '.';sleep 3;done &
trap "kill $!" EXIT 
 sudo update_dyld_shared_cache -debug -force -root / 2>/dev/null

kill $!
wait $! 2>/dev/null
trap " " EXIT

           if [ ! $loc = "ru" ]; then
printf '\n\nSystem Frameworks Cache Updated\n'
printf 'Reboot the system to apply the settings\n\n'
sleep 1
                else
printf '\n\nКэш системных сценариев обновлен\n'
printf 'Перезагрузите систему для применения изменений\n\n'
            fi
fi

    rm -R ./HybridMode
    rm -R ./Original
    rm -R -f ./__MACOSX


if [ ! $loc = "ru" ]; then
read -p "Press any key to close this window " -n 1 -r
                else
read -p "Для выхода нажмите любую клавишу" -n 1 -r
            fi
clear
osascript -e 'tell application "Terminal" to close first window' & exit

exit
