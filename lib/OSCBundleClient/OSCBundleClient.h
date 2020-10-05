#ifndef OSCBUNDLECLIENT_H
#define OSCBUNDLECLIENT_H

#include <ArduinoOSC.h>

namespace arduino
{
    namespace osc
    {
        namespace client
        {
            template <typename S>
            struct Bundler
            {
                OscEncoder writer;
                S stream;
                static constexpr uint16_t PORT_DISCARD{9};

                Bundler()
                {
                    stream.begin(PORT_DISCARD);
                }

                void begin_bundle()
                {
                    this->writer.init().begin_bundle();
                }

                void encode(Message &msg)
                {
                    this->writer.encode(msg);
                }

                void end_bundle()
                {
                    this->writer.end_bundle();
                }

                void send(const String &ip, const uint16_t port)
                {
                    this->stream.beginPacket(ip.c_str(), port);
                    this->stream.write(this->writer.data(), this->writer.size());
                    this->stream.endPacket();
                }
            };
            // template <typename S>
            // class BundleClient
            // {
            //     OscEncoder writer;
            //     S stream;
            //     static constexpr uint16_t PORT_DISCARD{9};

            // public:
            //     BundleClient() {stream.begin(PORT_DISCARD);}

            //     template <typename T>
            //     void send(const String &ip, const uint16_t port, const String &base_addr, const vector<String> &addrs, const vector<T> &ts)
            //     {
            //         vector<String> new_addrs;
            //         for (int i = 0; i < addrs.size(); i++)
            //         {
            //             new_addrs[i] = base_addr + addrs[i];
            //         }
            //         send(ip, port, new_addrs, ts);
            //     }

            //     template <typename T>
            //     void send(const String &ip, const uint16_t port, const vector<String> &addrs, const vector<T> &ts)
            //     {
            //         if (addrs.size() != ts.size())
            //         {
            //             Serial.println("Need to have the same number of values and addresses");
            //             return;
            //         }
            //         Message m;
            //         vector<Message> msgs;
            //         for (uint8_t i = 0; i < addrs.size(); i++)
            //         {
            //             m.init(addrs[i]);
            //             m.push(ts[i]);
            //             msgs.push_back(m);
            //         }
            //         send(ip, port, msgs);
            //     }

            //     void send(const String &ip, const uint16_t port, vector<Message> &m)
            //     {
            //         this->writer.init().begin_bundle();
            //         for (auto it = m.begin(); it != m.end(); it++)
            //         {
            //             this->writer.encode(*it);
            //         }
            //         this->writer.end_bundle();
            //         this->stream.beginPacket(ip.c_str(), port);
            //         this->stream.write(this->writer.data(), this->writer.size());
            //         this->stream.endPacket();
            //     }
            // };

        } // namespace client
    }     // namespace osc
}         // namespace arduino

template <typename S>
using OscBundler = arduino::osc::client::Bundler<S>;

#endif