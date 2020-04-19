#include "backend.h"
#include <QQmlApplicationEngine>
#include <QQuickWindow>

Backend::Backend(QQmlApplicationEngine *engine, QObject *parent) : QObject(parent)
{
    _engine = engine;
}

void Backend::changeWindow()
{
    QObject *qObject = _engine->rootObjects().first();
    Q_ASSERT( qObject != NULL );

    QQuickWindow* mainWindow = qobject_cast<QQuickWindow*>(qObject);
    Q_ASSERT( mainWindow );

    _main = !_main;
    if (_main)
    {
        _engine->load(QUrl(QStringLiteral("qrc:/main.qml")));
    } else
    {
        _engine->load(QUrl(QStringLiteral("qrc:/samplewindow.qml")));
    }
    mainWindow->close();
    qObject->deleteLater();
}
