#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickView>
#include <QScreen>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    QScreen *screen = QGuiApplication::primaryScreen();
    QQuickView view;
    view.setSource(QUrl(QStringLiteral("qrc:/crosshair.qml")));
    view.setX(screen->geometry().width()/2 - view.width()/2);
    view.setY(screen->geometry().height()/2 - view.height()/2);
    view.setColor("transparent");
    view.setFlags(Qt::SubWindow | Qt::FramelessWindowHint | Qt::WindowStaysOnTopHint);
    view.show();

    return app.exec();
}
