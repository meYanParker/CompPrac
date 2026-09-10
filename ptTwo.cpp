#include <iostream>
#include <stdexcept>

template <typename T>
class Queue {
private:
    struct Node {
        T data;
        Node* next;
        Node(T val) : data(val), next(nullptr) {}
    };

    Node* head; 
    Node* tail; //хвост

        // Метод очистки памяти
    void clear() {
        while (!isEmpty()) Dequeue(); // Прайвад
    }

public:
    // создание пустой очереди
    Queue() : head(nullptr), tail(nullptr) {}

    //создание очереди сразу с одним элементом)
    Queue(T val) : head(nullptr), tail(nullptr) {
        Enqueue(val);
}

    ~Queue() { 
        std::cout << "\nВызван деструктор, очищаем память\n";
        clear(); 
    }



    // Проверка на пустоту
    bool isEmpty() const { return head == nullptr; }

    // Добавление (Enqueue)
    Queue& Enqueue(T val) { //Тип для цеопчки вызывов
        Node* newNode = new Node(val);
        if (isEmpty()) {
            head = tail = newNode;
        } else {
            tail->next = newNode;
            tail = newNode;
        }
        return *this; // Возвращаем сам объект
    }

    // Извлечение (Dequeue)
    T Dequeue() {   
        Node* temp = head;
        T val = head->data;
        head = head->next;
        if (!head) tail = nullptr;
        delete temp;
        return val;
    }

    //Конструктор копирования (Queue q2 = q1)
    Queue(const Queue& other) : head(nullptr), tail(nullptr) {
        Node* temp = other.head;
        while (temp) {
            Enqueue(temp->data);
            temp = temp->next;
        }
    }

    // Оператор копирующего присваивания (q2 = q1)
    Queue& operator=(const Queue& other) {
        if (this != &other) {
            clear(); // Чистим старые узлы
            Node* temp = other.head;
            while (temp) {
                Enqueue(temp->data);
                temp = temp->next;
            }
        }
        return *this;
    }

    // Конструктор перемещения 
    Queue(Queue&& other) noexcept : head(other.head), tail(other.tail) {
        other.head = nullptr; // Чтобы деструктор не удалил действующую цепочку
        other.tail = nullptr;
    }

    // Оператор перемещающего присваивания 
    Queue& operator=(Queue&& other) noexcept {
        if (this != &other) {
            clear();  // Чистим
            head = other.head; 
            tail = other.tail;
            other.head = nullptr; // Старый объект обнуляем
            other.tail = nullptr;
        }
        return *this;
    }
};

int main() {
    setlocale(LC_ALL, "ru_RU.UTF-8");
    Queue<unsigned int> q;
    int choice;
    unsigned int val;

    while (true) {
        std::cout << "\n--- МЕНЮ ОЧЕРЕДИ ---\n";
        std::cout << "1. Добавить (Enqueue)\n2. Удалить (Dequeue)\n3. Показать все\n";
        std::cout << "4. Очистить\n5. Тест Move (в q2)\n";
        std::cout << "6. Проверка на пустоту\n0. Выход\n ---- Ваш выбор \n";
        std::cin >> choice;

        if (choice == 0) break;

        switch (choice) {
            case 1: 
                std::cout << "Значение: "; std::cin >> val;
                q.Enqueue(val); break;
            case 2:
                if (!q.isEmpty()) {
                    val = q.Dequeue();
                    std::cout << "Извлечено значение: " << val << "\n";
                } else {
                    std::cout << "Ошибка: Очередь пуста! Сначала добавьте элементы.\n";
                }
                break;
            case 3: //Переделан через поп
                if (q.isEmpty()) {
                    std::cout << "очередь пуста\n";
                } else {
                    std::cout << "Элементы очереди: ";
                    // копи
                    Queue<unsigned int> tempCopy = q; 
                    while (!tempCopy.isEmpty()) {
                        std::cout << tempCopy.Dequeue() << " ";
                    }
                    std::cout << "\n";
                }
                break;
            case 4: //Переделан через поп
                if (q.isEmpty()) {
                    std::cout << "Очередь и так пуста.\n";
                } else {
                    while (!q.isEmpty()) {
                        q.Dequeue(); 
                    }
                    std::cout << "Очередь успешно очищена через Dequeue().\n";
                }
                break;
            case 5: {
                std::cout << "Переносим данные из основной в q2\n";
                    Queue<unsigned int> q2 = std::move(q); 
                
                    std::cout << "Теперь q2: ";
                    Queue<unsigned int> tempQ2 = q2;
                    while (!tempQ2.isEmpty()) {
                        std::cout << tempQ2.Dequeue() << " ";
                    }
                    std::cout << "\nА основная очередь q: " << (q.isEmpty() ? "[Пуста]" : "Ошибка!");

                    std::cout << "\n(Возвращаем данные назад из q2 в q)\n";

                    q = std::move(q2); 
                    break;
            }
            // case 6: { // Безопасный просмотр
            //     if (q.isEmpty()) {
            //         std::cout << "Очередь пуста.\n";
            //     } else {
            //         std::cout << "Текущая очередь: ";
            //         Queue<unsigned int> tempCopy = q; 
            //         while (!tempCopy.isEmpty()) {   
            //             std::cout << tempCopy.Dequeue() << " ";
            //         }
            //         std::cout << "\n(Оригинал сохранен)\n";
            //     }
            //     break;
            // }

            case 6: {
                if (q.isEmpty()) { 
                    std::cout << "Очередь пуста\n";
                } else {
                    std::cout << "Очередь содержит объект\n";
                }
                break;
            }

            default:
                std::cout << "Неверный пункт меню.\n";
                break;

            // case 6: {
            //     unsigned int pVal;
            //     std::cout << "Введите начальное значение для новой очереди: ";
            //     std::cin >> pVal;
                
            //     Queue<unsigned int> tempQ(pVal); 
                
            //     std::cout << "Создана временная очередь tempQ с элементом: ";
            //     tempQ.print();
            //     std::cout << "\n";
            //     //удалится сам при выходе из этого блока {}, сработает деструктор
            //     break;
            // }
            //        default:
            //    std::cout << "Неверный пункт меню.\n";
            //return 0;  
        }
    }
    return 0;
}
