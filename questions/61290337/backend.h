#ifndef BACKEND_H
#define BACKEND_H

#include <QObject>

class QQmlApplicationEngine;
class Backend : public QObject
{
    Q_OBJECT
public:
    explicit Backend(QQmlApplicationEngine *engine, QObject *parent = nullptr);

    Q_INVOKABLE void changeWindow();

private:
    QQmlApplicationEngine *_engine = nullptr;
    bool _main = true;
};

#endif // BACKEND_H
