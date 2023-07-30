python qlora/qlora.py --model_name ./model/Chinese-Llama-2-7b \
--data_set ./data/first_1000.json \
--source_max_len=512 \
--target_max_len=512 \
--dataset_format alpaca \
--max_steps 100 \
--save_steps 50 \
--eval_steps 50 \
--save_strategy steps \
--output_dir ./output_all