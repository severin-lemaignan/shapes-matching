#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQmlComponent>

#include "fileio.hpp"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    FileIO fileio;


    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("fileio", &fileio);

    QQmlComponent component(&engine, QUrl(QStringLiteral("qrc:/main.qml")));
    component.create();

    return app.exec();
}
