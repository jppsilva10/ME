for /l %%x in (2301, 1, 2330) do (
   python gen.py 30 0.4 %%x input.txt
   call code2.exe %%x 1000 input.txt >> output2_n30_p40.txt
)