#### User model

| Column name | data type |
| :---------: | :-------: |
|     id      |  integer  |
|  user_name  |  string   |
|    email    |  string   |
|  password   |  string   |

#### Task model

| Column name | data type |
| :---------: | :-------: |
|     id      |  integer  |
|   user_id   |  integer  |
|  task_name  |  string   |
| discription |   text    |
|  deadline   | datetime  |
|   status    |  string   |
|  priority   |  string   |

#### Task_labels model

| Column name | data type |
| :---------: | :-------: |
|     id      |  integer  |
|   task_id   |  integer  |
|  label_id   |  integer  |

#### Labe model

| Column name | data type |
| :---------: | :-------: |
|     id      |  integer  |
| label_name  |  string   |
