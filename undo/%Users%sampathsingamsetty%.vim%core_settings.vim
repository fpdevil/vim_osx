Vim�UnDo� J��'ܭ�n̻u}��KmX�v��4P�*O#W�O   �   9        set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9   %   (      >       >   >   >    X{��   	 _�                     E       ����                                                                                                                                                                                                                                                                                                                                                             Xx��    �   E   J   �       �   E   G   �    5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             Xy{�     �         �       �         �    5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             Xy|     �         �      let s:uname = system("uname")5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             Xy|-     �          �       5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             Xy|4    �                &set guifont=Monaco\ for\ Powerline:h125�_�                           ����                                                                                                                                                                                                                                                                                                                                                             X{��     �         �      " �         �    5�_�                       "    ����                                                                                                                                                                                                                                                                                                                                                             X{��     �         �      #let os = substitute(system('uname')5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             X{�(     �                )let os = substitute(system('uname', '\n')5�_�                            ����                                                                                                                                                                                                                                                                                                                                                          X{�E     �         �      if s:uname == "Darwin\n"   *    set guifont=Monaco\ for\ Powerline:h12   endif�         �      let s:uname = system("uname")5�_�                            ����                                                                                                                                                                                                                                                                                                                                                          X{�J     �      !   �      "�          �    5�_�                        "    ����                                                                                                                                                                                                                                                                                                                                                          X{�c     �      !   �      "let os = substitute(system('uname'5�_�                        )    ����                                                                                                                                                                                                                                                                                                                                                          X{�h     �      !   �      )let os = substitute(system('uname'), '\n'5�_�                        -    ����                                                                                                                                                                                                                                                                                                                                                          X{�k     �      !   �      -let os = substitute(system('uname'), '\n', ''5�_�                        1    ����                                                                                                                                                                                                                                                                                                                                                          X{�l     �      "   �      1let os = substitute(system('uname'), '\n', '', ''5�_�                    !       ����                                                                                                                                                                                                                                                                                                                                                          X{�w     �       "   �      if os == 'Darwin'5�_�                    !        ����                                                                                                                                                                                                                                                                                                                                                          X{�~     �       #   �       if os == 'Darwin' || os == 'Mac'5�_�                    "       ����                                                                                                                                                                                                                                                                                                                                                          X{��     �   !   %   �          let s:sysos = 'osx'5�_�                    $       ����                                                                                                                                                                                                                                                                                                                                                          X{��    �   #   '   �      if s:sysos == 'osx'5�_�                     &        ����                                                                                                                                                                                                                                                                                                                                                          X{�,     �   %   &          endif5�_�      !               %        ����                                                                                                                                                                                                                                                                                                                                                          X{�.     �   %   '   �          �   %   '   �    5�_�       "           !   &       ����                                                                                                                                                                                                                                                                                                                                                          X{�D     �   &   )   �          set guifont=�   '   (   �    �   %   (   �      elseif s:sysos == 'linux'5�_�   !   #           "   #       ����                                                                                                                                                                                                                                                                                                                                                          X{�i     �   "   %   �      endif5�_�   "   $           #   %        ����                                                                                                                                                                                                                                                                                                                                                          X{��     �   $   &   �      if s:sysos == 'osx'5�_�   #   %           $   &       ����                                                                                                                                                                                                                                                                                                                                                          X{��     �   %   '   �      *    set guifont=Monaco\ for\ Powerline:h125�_�   $   &           %   '        ����                                                                                                                                                                                                                                                                                                                                                          X{��     �   &   (   �      elseif s:sysos == 'linux'5�_�   %   '           &   (       ����                                                                                                                                                                                                                                                                                                                                                          X{��     �   '   )   �      5    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 95�_�   &   (           '   )        ����                                                                                                                                                                                                                                                                                                                                                          X{��     �   (   *   �      endif5�_�   '   )           (   )   	    ����                                                                                                                                                                                                                                                                                                                                                          X{��    �   (   +   �      	    endif5�_�   (   *           )           ����                                                                                                                                                                                                                                                                                                                                                          X{��     �          �       5�_�   )   +           *      
    ����                                                                                                                                                                                                                                                                                                                                                          X{��     �          �      " get the os running5�_�   *   ,           +   #       ����                                                                                                                                                                                                                                                                                                                                                          X{��    �   "   &   �      endif5�_�   +   -           ,           ����                                                                                                                                                                                                                                                                                                                                                 v       X{��    �         �      " set default font for vim   "let s:uname = system("uname")   "if s:uname == "Darwin\n"   +"    set guifont=Monaco\ for\ Powerline:h12   "endif   " get the system os running5�_�   ,   .           -           ����                                                                                                                                                                                                                                                                                                                                                 v       X{��    �      !   �      )" set default fontset for vim in gui mode5�_�   -   /           .   %   (    ����                                                                                                                                                                                                                                                                                                                                                             X{��     �   $   &   �      9        set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 95�_�   .   0           /   %   (    ����                                                                                                                                                                                                                                                                                                                                                             X{��     �   $   &   �      8        set guifont=DejaVu\ Sans\ Mono\ or\ Powerline\ 95�_�   /   1           0   %   (    ����                                                                                                                                                                                                                                                                                                                                                             X{��     �   $   &   �      7        set guifont=DejaVu\ Sans\ Mono\ r\ Powerline\ 95�_�   0   2           1   %   (    ����                                                                                                                                                                                                                                                                                                                                                             X{��     �   $   &   �      6        set guifont=DejaVu\ Sans\ Mono\ \ Powerline\ 95�_�   1   3           2   %   (    ����                                                                                                                                                                                                                                                                                                                                                             X{��     �   $   &   �      5        set guifont=DejaVu\ Sans\ Mono\  Powerline\ 95�_�   2   4           3   %   (    ����                                                                                                                                                                                                                                                                                                                                                             X{��     �   $   &   �      4        set guifont=DejaVu\ Sans\ Mono\ Powerline\ 95�_�   3   5           4   %   (    ����                                                                                                                                                                                                                                                                                                                                                             X{��     �   $   &   �      3        set guifont=DejaVu\ Sans\ Mono\ owerline\ 95�_�   4   6           5   %   (    ����                                                                                                                                                                                                                                                                                                                                                             X{��     �   $   &   �      2        set guifont=DejaVu\ Sans\ Mono\ werline\ 95�_�   5   7           6   %   (    ����                                                                                                                                                                                                                                                                                                                                                             X{��     �   $   &   �      1        set guifont=DejaVu\ Sans\ Mono\ erline\ 95�_�   6   8           7   %   (    ����                                                                                                                                                                                                                                                                                                                                                             X{��     �   $   &   �      0        set guifont=DejaVu\ Sans\ Mono\ rline\ 95�_�   7   9           8   %   (    ����                                                                                                                                                                                                                                                                                                                                                             X{��     �   $   &   �      /        set guifont=DejaVu\ Sans\ Mono\ line\ 95�_�   8   :           9   %   (    ����                                                                                                                                                                                                                                                                                                                                                             X{��     �   $   &   �      .        set guifont=DejaVu\ Sans\ Mono\ ine\ 95�_�   9   ;           :   %   (    ����                                                                                                                                                                                                                                                                                                                                                             X{��     �   $   &   �      -        set guifont=DejaVu\ Sans\ Mono\ ne\ 95�_�   :   <           ;   %   (    ����                                                                                                                                                                                                                                                                                                                                                             X{��     �   $   &   �      ,        set guifont=DejaVu\ Sans\ Mono\ e\ 95�_�   ;   =           <   %   (    ����                                                                                                                                                                                                                                                                                                                                                             X{��     �   $   &   �      +        set guifont=DejaVu\ Sans\ Mono\ \ 95�_�   <   >           =   %   )    ����                                                                                                                                                                                                                                                                                                                                                             X{��     �   $   &   �      *        set guifont=DejaVu\ Sans\ Mono\  95�_�   =               >   %   (    ����                                                                                                                                                                                                                                                                                                                                                             X{��   	 �   $   &   �      )        set guifont=DejaVu\ Sans\ Mono\  5�_�      	                (    ����                                                                                                                                                                                                                                                                                                                                                             X{��     �         �      -let os = substitute(system('uname', '\n', '')5�_�      
           	      ,    ����                                                                                                                                                                                                                                                                                                                                                             X{��     �         �      1let os = substitute(system('uname', '\n', '', '')5�_�   	              
          ����                                                                                                                                                                                                                                                                                                                                                             X{��     �         �      if :uname == "Darwin\n"5�_�   
                        ����                                                                                                                                                                                                                                                                                                                                                             X{��     �         �      if uname == "Darwin\n"5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             X{��     �         �      if name == "Darwin\n"5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             X{��     �         �      if ame == "Darwin\n"5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             X{��     �         �      if me == "Darwin\n"5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             X{��     �         �      if e == "Darwin\n"5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             X{��     �         �      if  == "Darwin\n"5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             X{��     �         �      if os == "Darwin\n"5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             X{��     �         �      if os == 'Darwin'5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             X{��     �         �       if os == 'Darwin' || os == 'Mac'5��