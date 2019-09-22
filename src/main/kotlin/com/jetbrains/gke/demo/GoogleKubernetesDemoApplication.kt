package com.jetbrains.gke.demo

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

@SpringBootApplication
class GoogleKubernetesDemoApplication

fun main(args: Array<String>) {
    runApplication<GoogleKubernetesDemoApplication>(*args)
}
